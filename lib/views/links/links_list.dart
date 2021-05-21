import 'package:flutter_svg/svg.dart';
import 'package:technocrats/core/models/external_links.dart';
import 'package:technocrats/mutations/get_apis_mutation.dart';
import 'package:technocrats/utils/utils.dart';
import 'package:technocrats/views/common/my_rich_text.dart';
import 'package:technocrats/views/common/no_data_page.dart';
import 'package:url_launcher/link.dart';

import 'package:technocrats/pkgs.dart';

class LinksList extends StatelessWidget {
  final List<ExternalLinks> links;

  const LinksList({Key key, this.links}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store store = VxState.store;
    return links.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: links.length,
            itemBuilder: (context, index) {
              final ExternalLinks link = links[index];
              return Card(
                elevation: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    link.title.text.xl.semiBold.make(),
                    10.heightBox,
                    // if (!Vx.isWeb)
                    if (link.favicon.endsWith("svg"))
                      SvgPicture.network(link.favicon)
                    else
                      Image.network(link.favicon),
                    MyRichText(title: "Desc", value: link.description),
                    10.heightBox,
                    Link(
                      uri: Uri.parse(link.url),
                      target: LinkTarget.blank,
                      builder: (context, followLink) => link
                          .url.text.semiBold.blue400
                          .make()
                          .onTap(followLink),
                    ),
                    10.heightBox,
                    if (link.cityId != null)
                      MyRichText(
                          title: "City",
                          value: CityMutation.getCity(store, link.cityId)),
                    MyRichText(
                        title: "Submitted",
                        value: Utils.getFormattedTime(link?.createdAt)),
                  ],
                ).p16(),
              );
            },
          ).h(context.percentHeight * 80)
        : NoDataPage();
  }
}
