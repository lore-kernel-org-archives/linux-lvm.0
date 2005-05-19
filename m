Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4JEL3O05305
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 10:21:03 -0400
Received: from breemxgw3s01.ras (relay1.rasnet.it [213.156.34.249])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4JEKveH001688
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 10:20:57 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] same LV UUID after vgmerge
Date: Thu, 19 May 2005 16:20:56 +0200
Message-ID: <BFCF159FFD14F444B205968F32DBD5BB01700408@MAILEX01.rasgroup.ita.localnet>
From: "Magni Fabrizio" <Fabrizio.Magni@rasnet.it>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alasdair,

the lvm version is:

# lvm version
  LVM version:     2.00.15 (2004-04-19)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.3.0

and I converted my VG with vgconvert.

Now I restored all my original volume group and I'm ready for another
test.

Is it safe to edit the UUID by hand?

Fabrizio


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Alasdair G Kergon
> Sent: Thursday, May 19, 2005 4:03 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] same LV UUID after vgmerge
> 
> 
> On Thu, May 19, 2005 at 11:58:09AM +0200, Magni Fabrizio wrote:
> > Now the strange part: all the logical volumes have 
> duplicated LV UUID.
>  
> What version of lvm?   (Run 'lvm version')
> 
> Looks like a bug: the vgmerge code checks for duplicate LV names 
> but not duplicate UUIDs.
> 
> Is this still lvm1 metadata? (You didn't run 'vgconvert')
> 
> > Any idea how to solve this issue?
> 
> You're going to have to edit the UUIDs by hand:
>   vgchange -an oradata1_a
>   vgcfgbackup oradata1_a
> Edit the UUIDs in /etc/lvm/backup/oradata1_a uuid making them all
> different:
> 
>                 lvol1 {
>                         id = "000000-0000-0000-0000-0000-0000-000001"
> becomes
>                 lvol1 {
>                         id = "000000-0000-0000-0000-0000-0000-000002"
> etc.
> 
> Then:
>   vgcfgrestore oradata1_a
>  
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
