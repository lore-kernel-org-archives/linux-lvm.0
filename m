From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20021025143000.A4081@sistina.com>
References: <008a01c27ba7$81ad2c40$6a01a8c0@bmoon>
Mime-Version: 1.0
In-Reply-To: <008a01c27ba7$81ad2c40$6a01a8c0@bmoon>; from bo@anthologysolutions.com on Thu, Oct 24, 2002 at 02:51:28PM -0700
Subject: [linux-lvm] Re: any helpful document for lvm driver and tool
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
Date: Fri Oct 25 07:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bmoon <bo@anthologysolutions.com>
Cc: linux-lvm@sistina.com, mauelshagen@sistina.com

On Thu, Oct 24, 2002 at 02:51:28PM -0700, bmoon wrote:
> LVM gurus,
> 
> Are there any documents which can help me to understand the source codes for
> lvm driver, and
> LVM tool?
> 
> There are tqo nice documents related with LVM such as
> 
> - The logical Volume manager white paper from SUSE
> - Volume managers in Linux - David Teigland & Heinz Mauelshagen.
> 
> These helped me to understand the concept of LVM, but they do not cover
> any design concepts or data structure or implementation details.
> 
> Yes, I could find some information on each source codes.
> 
> Any more?

Bo,
no.

you want to read the source code starting with the metadata definitions
in lvm.h and the metadata read/write routines in:

   pv_{read|write}*.c,
   vg_{read|write}*.c,
   lv_{read|write}*.c


Give LVM2 a glance, which is compatible to LVM1 and has a better
structured library.

> 
> Regards,
> 
> Bo

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
