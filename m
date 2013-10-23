Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9NKQ6Ok001664
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 16:26:06 -0400
Received: from dub0-omc3-s5.dub0.hotmail.com (dub0-omc3-s5.dub0.hotmail.com
	[157.55.2.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9NKQ5j1004662
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 16:26:05 -0400
Message-ID: <DUB118-W973F5E6250AE338D1B00D9C030@phx.gbl>
From: David Binderman <dcb314@hotmail.com>
Date: Wed, 23 Oct 2013 20:26:04 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2.2.02.103/tools/lvchange.c:779: bad if test ?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello there,

I just compiled LVM2.2.02.103 with the extra Linux gcc compiler 
flag -Wlogical-op

It said

lvchange.c:779:10: warning: logical 'or' of collectively exhaustive tests is always true [-Wlogical-op]

Source code is

���������������� ((tmp_str[tmp_str_len - 1] != 't') ||
����������������� (tmp_str[tmp_str_len - 1] != 'y') ||
����������������� (tmp_str[tmp_str_len - 1] != 'n'))))

Suggest swap || for &&

Regards

David Binderman 		 	   		  
