Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAENTK9d029723
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:29:20 -0500
Received: from twist.antaree.com (diego.snet.sk [188.123.97.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAENT5nt023103
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:29:05 -0500
Date: Mon, 15 Nov 2010 00:28:45 +0100
From: Marek Soha <marek@snet.sk>
Message-ID: <1312258454.20101115002845@snet.sk>
In-Reply-To: <4CE06A08.1050209@bmsi.com>
References: <606057079.20101114024527@snet.sk> <4CE06A08.1050209@bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM volume umask change
Reply-To: Marek Soha <marek@snet.sk>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Stuart D Gathman <stuart@bmsi.com>
Cc: linux-lvm@redhat.com

Hehe :)

You are joking, aren't you?

Please look into lvm.conf and try to find umask part...
System umask is set correctly and this issue is happening only in LVM
mount.

Stuart, d�a 15. novembra 2010 ste nap�sali:
SDG> On 11/13/2010 08:45 PM, Marek Soha wrote:
SDG> When I create file/directory in LVM volume, it is created with
SDG> permissions (mode) 666. I need to get 644.
SDG> I changed umask in /etc/lvm/lvm.conf, but it did not helped.
SDG> Any ideas?

SDG> lvm.conf has nothing to do with any filesystems (and associated
SDG> files and directories) you might happen to create on a logical volume.

SDG> Your question is a basic unix question.  Try "man umask".
