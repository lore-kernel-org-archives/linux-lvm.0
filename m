From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Some suggestions about lvminitrd_create
Message-ID: <20020516162341.A25098@sistina.com>
References: <E177uaF-0000ja-00@jelly.buzzard.org.uk>
Mime-Version: 1.0
In-Reply-To: <E177uaF-0000ja-00@jelly.buzzard.org.uk>; from jonathan@buzzard.org.uk on Wed, May 15, 2002 at 09:56:31AM +0100
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
Date: Thu May 16 09:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 15, 2002 at 09:56:31AM +0100, Jonathan Buzzard wrote:
> 
> Just a couple of suggestions firstly it would be nice if it checked
> for /boot/System.map-'uname -r' rather than for just /boot/System.map.
> When you have more than one kernel floating about this is handy.

Yep, that's what the "-F" option aims to support.

> 
> Second suggestion it would be nice if a -t option existed to allow a
> choice in the type of filesystem the initrd is created in. Not everyone
> is using ext2 these days :)

Well, why do you want to use a different filesystem on a relatively tiny
and little populated ram disk?

> 
> JAB.
> 
> -- 
> Jonathan A. Buzzard                 Email: jonathan@buzzard.org.uk
> Northumberland, United Kingdom.       Tel: +44(0)1661-832195
> 
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
