Return-Path: <austin@coremetrics.com>
Date: Wed, 23 May 2001 17:38:25 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] ORACLE OPS and Fibre channel
In-Reply-To: <85256A55.0061ED1B.00@IBJS06DS.ibjs.com>
Message-ID: <Pine.LNX.4.33.0105231738160.26113-100000@UberGeek.coremetrics.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I think you need the raw_io patch.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On Wed, 23 May 2001, Slava Tulchinsky wrote:

>
>
> After successfully installing Oracle 8.1.7.0.1 OPS on Redhat 6.2 with
> 2.2.19-6.2.1 using Compaq fibre channel card RA4000 to connect to Compaq
> external drive enclosure RA4100 (kernel driver cpqfc), We decided see if OPS
> will work with lvm 0.9.1-Beta7. After following all the instructions in INSTALL
> and README files was able to compile patch file. when running the patch against
> kernel sorce genhd.c.rej was created, I was still able to compile the kernel and
> install lvm. LVM part seems to work fine, but when booting with the newly
> compiled
> kernel no longer able to use raw partitions with OPS with or without LVM.
>
> Corrupt block relative dba: 0x00000001 (file 0, block 1)
> Fractured block found during control file header read
> Data in bad block -
> type: 21 format: 2 rdba: 0x00000001
> last change scn: 0xffff.00000002 seq: 0x1 flg: 0x04
> consistency value in tail: 0x00000000
> check value in block header: 0x3574, computed block checksum: 0x9a9
> spare1: 0x0, spare2: 0x0, spare3: 0x
>
> Corrupt block relative dba: 0x00000001 (file 0, block 1)
> Fractured block found during control file header read
> Data in bad block -
> type: 21 format: 2 rdba: 0x00000001
> last change scn: 0xffff.00000002 seq: 0x1 flg: 0x04
> consistency value in tail: 0x00000000
> check value in block header: 0x3574, computed block checksum: 0x9a9
> spare1: 0x0, spare2: 0x0, spare3: 0x
>
> When booting with the original kernal everything is OK
>
>
