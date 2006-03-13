Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2DFvl118965
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 10:57:47 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2DFvjbF031592
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 10:57:46 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3) with ESMTP id
	k2DFvRo7003791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 13 Mar 2006 09:57:27 -0600
Date: Mon, 13 Mar 2006 09:57:27 -0600 (CST)
From: Nate Carlson <natecars@natecarlson.com>
Subject: Re: [linux-lvm] I/O error
In-Reply-To: <4415681D.5080806@arnet.net.ar>
Message-ID: <Pine.LNX.4.63.0603130956290.2557@tungsten.msp.technicality.org>
References: <4415681D.5080806@arnet.net.ar>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 13 Mar 2006, German Staltari wrote:
> The Storage Admin told me that there are two path to the same storage 
> (disk). I would like to know if this is an error to be worried about or 
> is just info? And if there's a way to avoid this output. Also, when a I 
> run 'dmesg', I have this output (if I clear with 'dmesg -c', it will 
> appear again in the next minutes):

You might want to download QLogic's drivers for the card, and build them 
with multipath support.. then you'll only see the drives once, and it 
should hopefully clear out these errors for you.

(The multipath driver used to be included in the qlogic drivers in the 
kernel, but were removed for some reason I Don't recall..)

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------
