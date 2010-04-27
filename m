Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3R7fHTa026003
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2010 03:41:17 -0400
Received: from mail-pz0-f188.google.com (mail-pz0-f188.google.com
	[209.85.222.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3R7f1Ts017627
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2010 03:41:02 -0400
Received: by pzk26 with SMTP id 26so8963903pzk.6
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2010 00:41:01 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Apr 2010 15:41:01 +0800
Message-ID: <j2z4e546c861004270041v325c1bf5tb48b385048462e33@mail.gmail.com>
From: James Corteciano <james@linux-source.org>
Content-Type: multipart/alternative; boundary=00504502cc2bdaac1804853303ff
Subject: [linux-lvm] Clustered LVM Snapshots
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
To: linux-lvm@redhat.com

--00504502cc2bdaac1804853303ff
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

Is there a patch to be able to use Clustered LVM snapshot?

[root@rhel5.5]# lvcreate -L500M -s -n lv00-snp0 /dev/vg-mysql2/lv00
Clustered snapshots are not yet supported.

Thanks.
James

--00504502cc2bdaac1804853303ff
Content-Type: text/html; charset=ISO-8859-1

Hi All,<br><br>Is there a patch to be able to use Clustered LVM snapshot?<br><br>[root@rhel5.5]# lvcreate -L500M -s -n lv00-snp0 /dev/vg-mysql2/lv00<br>Clustered snapshots are not yet supported.<br><br>Thanks.<br>James<br>

--00504502cc2bdaac1804853303ff--
