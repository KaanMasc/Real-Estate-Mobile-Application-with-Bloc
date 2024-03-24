import 'package:api/features/messages_page/widgets/message_preview_card.dart';
import 'package:api/features/messages_page/widgets/search_text_field.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:api/product/widgets/project_appbar.dart';
import 'package:flutter/material.dart';
import './messages_page_view_model.dart';

class MessagesPageView extends MessagesPageViewModel {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: ProjectAppBar(),
      body: Padding(
        padding: ProjectPaddings.pagepadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SeachMessagesTextField(),
              MessagesPreviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
