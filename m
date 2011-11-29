Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pATH6Q5J013811
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2011 12:06:26 -0500
Received: from smarty.dreamhost.com (smarty.dreamhost.com [208.113.175.8])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pATH6Qkr012926
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2011 12:06:26 -0500
Received: from hulk.dreamhost.com (hulk.dreamhost.com [75.119.204.199])
	by smarty.dreamhost.com (Postfix) with ESMTP id 76506717CEF
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2011 02:53:54 -0800 (PST)
Date: Tue, 29 Nov 2011 02:46:07 -0800
From: shtegtari <shtegtari@hulk.dreamhost.com>
Message-ID: <20111129104607.GA8239@hulk.dreamhost.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Recovering a volume after lost disk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I think I have run these commands before but all that hapens is:

#vgreduce --removemissing video # ; vgchange -ay
  Volume group "video" is already consistent
# lvs|grep video
# <nothng returend>

So, the problem is that I can see the voumee grop with vgs but not volume with lvs.

Anything else to try?
