Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2PLUZi4008771
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:30:35 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PLUYP0024646
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:30:34 -0400
Received: from melissa.gathman.org (melissa.gathman.org
	[IPv6:2001:470:8:809::1003]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2PLUWGp002862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:30:33 -0400
Message-ID: <5150C1F8.8090107@bmsi.com>
Date: Mon, 25 Mar 2013 17:30:32 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
In-Reply-To: <0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
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

Long ago, Nostradamus foresaw that on 03/25/2013 04:46 PM, Bj=EF=BF=BDrn
Nadrowski would write:
> Recreation of the volume group seemed  a good idea as I only had one volu=
me group on the pv and therefore I did not see how this could have destroye=
d anything.
> The (human-readable) data at the beginning of the device /dev/md127 is st=
ill there and does display the same information. Please see my posting
Recreating the vg overwrites the human-readable data at the beginning of
the device.  You claim that it is "still there" and is the "same
information".  But this cannot be true because originally that
information had your LV data, and now (apparently) it does not.  Do you
see your LVs when looking at the vg metadata with an editor??   What do
you mean by "displays the same information"?  Does lvs list your LVs?
