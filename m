From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] kernel: invalidate: busy buffer
Message-Id: <20020416163659.GA19531@balu.kawo2.rwth-aachen.de>
References: <2D0AFEFEE711D611923E009027D39F2B02F124@cdserv.meridian-data.com>
    <4186.200.184.103.3.1018972960.squirrel@www.dokbua.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4186.200.184.103.3.1018972960.squirrel@www.dokbua.com>
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
Date: Tue Apr 16 11:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 16, 2002 at 01:02:40PM -0300, Rene @ Webscorpion.com wrote:
> 
> LVM tools are 1.0.3 - but as I said, I was unable to run the patch against
> my kernel source -- and I need and -AC kernel to keep aquote happy.

At least there's a non-AC-Patch for quota 2 (i guess that's what you
mean with "aquote"). I'm using it here on a Redhat System with a custom
kernel. 

ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/

There are patches for adding Quota to ReiserFS which also need Quota 2
to work, so the V2 Quota patch is included.

Regards, Markus

-- 
Kostenloses MySQL Datenbank-Hosting:
http://www.google.com/search?q=welcome+to+phpmyadmin
