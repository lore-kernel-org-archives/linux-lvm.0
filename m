Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA41SSr03971
	for <linux-lvm@redhat.com>; Wed, 3 Nov 2004 20:28:28 -0500
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA41SQPw011198
	for <linux-lvm@redhat.com>; Wed, 3 Nov 2004 20:28:26 -0500
Message-ID: <41897E47.40202@m-cam.com>
Date: Wed, 03 Nov 2004 19:56:39 -0500
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Datarecovery on LVM volumes
References: <2E9DA7DCA1129B4DA2DCA703100F387D7C7CCF@deexch.ontrack.com>
In-Reply-To: <2E9DA7DCA1129B4DA2DCA703100F387D7C7CCF@deexch.ontrack.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: hengelland@krollontrack.de

hengelland@krollontrack.de wrote:

> We got a couple of drives with the partiton identifier "0x8E". They 
> are all part of an LVM with kind of EXT2 structures.
> The EXT2 structures do not look like they usually do ... superblocks 
> are way different.
> I would like to ask if somebody could provide me with some Offset 
> information how
> physical volumes, volume groups and logical volumes work together on a 
> sector table basis ...
>  
> Many thanks

Take a look at /etc/lvm/backup directory for files describing your 
volume group layout.
Also, look into vgcfgbackup and vgcfgrestore.
Good luck!


Arshavir
