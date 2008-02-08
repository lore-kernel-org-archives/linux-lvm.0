Received: from jeltz.chrissie.net (vpn-6-7.fab.redhat.com [10.33.6.7])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m188VIJw002525
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 03:31:18 -0500
Message-ID: <47AC1355.1090607@redhat.com>
Date: Fri, 08 Feb 2008 08:31:17 +0000
From: Patrick Caulfeld <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Docs on clustered option of vgcreate
References: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com><C8BC17D3-C468-4D0B-90D6-D0AB57918AF0@redhat.com><A78DB34D00374344A0AB65B6523C05DC02AFC2E5@marsden.win.datacash.com>	<9BB520CB-6D8D-49A5-BF38-92BEB8875FDF@redhat.com>
	<A78DB34D00374344A0AB65B6523C05DC02AFC31C@marsden.win.datacash.com>
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC02AFC31C@marsden.win.datacash.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Gerrard Geldenhuis wrote:
> Excellent, thanks for the answer, that makes it a lot clearer.
> 
>  
> 
> So coupled with exclusion lists etc.. I could have multiple machines
> connect to one LUN and each have its own logical volume. Is there a
> concept of a �master� in the cluster or does it work in the same way as
> tcp with an exponential backoff when the metadata is locked by a host
> for changing. I am assuming that cluster aware locking would allow
> server-a to create a new lv but not simalteneosly allowing server-b to
> create a new lv too.
> 
>  
> 
> I know should be experimenting with this but will ask in the mean time
> while I wait for my �test lun�.
> 
>  
> 
> If host A creates a lv on a shared storage will it automatically be
> marked as only belonging to host A or is that something you have to do
> by hand. I read somewhere in the man pages about tags that you need to
> add to achieve such things.
> 


Locking in CLVM is exclusive and there's no back off. There is no reason
for it, creating an LVM doesn't take very long and is done from a
command-line. Host 'b' will simply wait until host 'a' has finished its job.

If you need to mark LVs to be exclusive to a node you will need to use
tags to define which node is allowed access
