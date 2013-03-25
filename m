Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2PKaoB9012781
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:36:50 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PKanCd020116
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:36:49 -0400
Received: from melissa.gathman.org (melissa.gathman.org
	[IPv6:2001:470:8:809::1003]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2PKabG0001547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 16:36:39 -0400
Message-ID: <5150B555.4010207@bmsi.com>
Date: Mon, 25 Mar 2013 16:36:37 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
In-Reply-To: <244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 03/25/2013 04:25 PM, Bj=EF=BF=BDrn
Nadrowski would write:
>
> I did recreate the physical volume and the volume group using pvcreate an=
d vgcreate, please see the description of the problem=20
> on ubuntuforums for further details.
>
That was not a good idea.  You've now written over the major clue to
what happened.   Examining the beginning of the PV for the metadata -
perhaps offset or scrambled because of some inadvertent change to the
raid10 parameters - should have been your major priority!

Theory 2: the md driver on the knoppix CD is an earlier version that
puts metadata at the end of the volume, instead of at the beginning.=20
This would change the offsets of your metadata and extents.  It would
not see the newer md raid metadata, and create a new drive.  I'm not
sure if this theory is consistent with your history.

I *strongly* advise not doing any more writing to this device until you
know *exactly* what happened.
