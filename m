Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2RK8QIW029715
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 16:08:26 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2RK8OQP024974
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 16:08:25 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2RK8Kw7016828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 16:08:21 -0400
Message-ID: <515351B4.8080804@bmsi.com>
Date: Wed, 27 Mar 2013 16:08:20 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3Z80XNNzW4v9jwp4VuCi+L18RADtAi5WVcRXD68E8k3g@mail.gmail.com>
In-Reply-To: <CA+iDeo3Z80XNNzW4v9jwp4VuCi+L18RADtAi5WVcRXD68E8k3g@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

On 03/25/2013 05:50 PM, Bj=EF=BF=BDrn Nadrowski expounded in part:
> Well, I see I would have to remove the volume group first, at the very=20
> least.
I wouldn't.  Just think of your vgcreate as removing all LVs and=20
renaming the VG.  Now you want to undo all that
with a vgcfgrestore.
> But I would just be back in the middle of my problem description on=20
> ubuntuforums, wouldn' t I?
> Still no volume group, still no logical volumes...
Does knoppix have an older lvm version that doesn't recognize your=20
metadata?  I *hope* it doesn't have lvm1, which used binary metadata....

If you see the human readable metadata, and knoppix doesn't, then there=20
is a problem with knoppix.  Either ancient lvm, or the device filtered=20
out for vgscan in lvm.conf.
