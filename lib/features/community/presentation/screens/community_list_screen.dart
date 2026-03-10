import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:ezycourse_community/features/community/presentation/viewmodel/community_list_viewmodel.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/community_empty_state.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/community_error_state.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/community_list_card.dart';
import 'package:ezycourse_community/features/community/presentation/widgets/community_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityListScreen extends ConsumerStatefulWidget {
  const CommunityListScreen({super.key});

  @override
  ConsumerState<CommunityListScreen> createState() =>
      _CommunityListScreenState();
}

class _CommunityListScreenState extends ConsumerState<CommunityListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(communityListViewModelProvider.notifier).fetchCommunityList();
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        ref.watch(communityListViewModelProvider).hasMoreData) {
      ref.read(communityListViewModelProvider.notifier).fetchCommunityList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityListViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          await ref
              .read(communityListViewModelProvider.notifier)
              .refreshCommunityList();
        },
        child: CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // AppBar
            SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.surface,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0.5,
              title: Text('Communities', style: AppTextStyles.screenTitle),
              centerTitle: false,

            ),

            // Content
            if (state.isLoading && state.communityList.isEmpty)
              const CommunityListShimmer()
            else if (state.errorMessage != null && state.communityList.isEmpty)
              CommunityErrorState(
                message: state.errorMessage!,
                onRetry: () {
                  ref
                      .read(communityListViewModelProvider.notifier)
                      .refreshCommunityList();
                },
              )
            else if (state.communityList.isEmpty)
              const CommunityEmptyState()
            else ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                sliver: SliverToBoxAdapter(
                  child: CommunityListCard(communities: state.communityList),
                ),
              ),
              _buildLoadingFooter(state),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingFooter(CommunityListState state) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        child: state.isLoading && state.communityList.isNotEmpty
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.primary,
                ),
              )
            : !state.hasMoreData && state.communityList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "You're all caught up!",
                      style: AppTextStyles.cardSubtitle.copyWith(
                        color: AppColors.textGreyLight,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
      ),
    );
  }
}
