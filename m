From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Odd problem with Pure-ftpd on lvm volume.
Message-ID: <20020704114039.E9129@sistina.com>
References: <3D2235F8.8485.6AEF946@localhost>
Mime-Version: 1.0
In-Reply-To: <3D2235F8.8485.6AEF946@localhost>; from ByrneJB@Harte-Lyne.ca on Tue, Jul 02, 2002 at 11:23:36PM -0400
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
Date: Thu Jul  4 04:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 02, 2002 at 11:23:36PM -0400, James B. Byrne  wrote:
> OS RedHat7.3 Linux
> lvm 1.0.3
> pure-ftpd 1.0.11
> 
> I initially setup a logical volume with a capacity of 300 Mb. which is 
> used to receive files transmitted via pure-ftpd.  The initial space 
> allocation was insufficient and I extended the lv by an additional 50 
> Mb.  Now pure-ftp is reporting a "disk full error" when trying to 
> upload files, however local users can add files to the lv without error.
> 
> I have absolutely no idea of where to go from here.  It seems to me 
> that either both should work, or neither should work, but not that one 
> should fail and the other succeed.  Any help or direction on how to 
> investigate this would be appreciated.

Did you just grow the LV?

You need to extend the FS using the respective FS resizing tool as well
(resize2fs, resize_reiserfs, ...).

BTW: for ext2 the e2fsadm(8) command, which comes with LVM does both for you.


This doesn't really explain the local/remote difference unless:

- local users had root credentials avoiding the fs
  "reserved block count" to matter

- files uploaded where very large compared to the locally stored files

> 
> Regards,
> Jim
> ---     e-mail is NOT a secure channel 
> James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
> Harte & Lyne Limited          http://www.harte-lyne.ca
> 9 Brockley Drive              vox: +1 905 561 1241
> Hamilton, Ontario             fax: +1 905 561 0757
> Canada  L8E 3C3
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
