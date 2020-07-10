Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 091D5207AEBF
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2020 21:01:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32EB818056BD
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2020 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 89A964DC
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2020 22:55:07 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Y1HAiOLWaqEl for <linux-lvm@redhat.com>;
	Fri, 10 Jul 2020 22:55:06 +0200 (CEST)
Received: from [IPv6:2a02:2455:51c:dd00:d89d:b2e7:a613:9406] (unknown
	[IPv6:2a02:2455:51c:dd00:d89d:b2e7:a613:9406])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id B54B33D0
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2020 22:55:06 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <b2d2e4ca-318e-e9dd-6f53-2ce2952fe932@mglug.de>
Date: Fri, 10 Jul 2020 22:55:06 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] in lvm Shell --reportformat json is ignored
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

Im wondering, that using lvm commands directly and in a lvm-shell work
different:

lvs --reportformat json

works as expected, but the same command in lvm-shell shows only basic
reportformat:

root@p51:/home/oliver# lvs -o lv_name -S 'lv_name=~^thin' --reportformat
json
  {
      "report": [
          {
              "lv": [
                  {"lv_name":"thintest1"},
                  {"lv_name":"thintest2"}
              ]
          }
      ]
  }
root@p51:/home/oliver# lvm
lvm> lvs -o lv_name -S 'lv_name=~^thin' --reportformat json
  LV      
  thintest1
  thintest2
lvm>


Tfh!

Oliver
