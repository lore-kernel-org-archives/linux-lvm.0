Message-Id: <20020228130337.65981.qmail@web13001.mail.yahoo.com>
From: Prashant Kharche <pdkharche@yahoo.com>
Subject: Re: [linux-lvm] Cluster LVM
In-Reply-To: <20020228113040.GA1898@fib011235813.fsnet.co.uk>
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
Date: Thu Feb 28 07:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  Basically, we are putting a lock on the VG while it
is getting resized or for any tool which tries to
access VG .. So that no other user can access the
metadata of that VG.. 
WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
METADATA.. 
We thought of protecting VG DATA (NOT METADATA), but
it becomes very completed.. so as if now we are not
taking care of FS access..  
--- Joe Thornber <joe@fib011235813.fsnet.co.uk> wrote:
> On Thu, Feb 28, 2002 at 02:59:51AM -0800, Prashant
> Kharche wrote:
> > When tools are run they run with a lock
> > and and at that time the filesystem cannot access
> the
> > volume groups.
> 
> How are you preventing remote nodes from accessing
> the volume groups ?
> Or are you working on an 'offline' solution, where
> there can be no
> users of logical volumes while you resize them ?
> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

__________________________________________________
Do You Yahoo!?
Yahoo! Greetings - Send FREE e-cards for every occasion!
http://greetings.yahoo.com
