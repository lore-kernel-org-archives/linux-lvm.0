From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Question when installing LVM
Message-ID: <20030515215522.GC22215@www.13thfloor.at>
References: <269ACE34F7A8744688CC03618BF3B67D0645DA13@c092ex03.na.cintas.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <269ACE34F7A8744688CC03618BF3B67D0645DA13@c092ex03.na.cintas.com>
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
Date: Thu May 15 16:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 15, 2003 at 02:49:59PM -0400, Murray, Bobby wrote:
> John,
> Thanks for the information. I think my problem is I do not have the kernel- source rpm installed. Any idea where I can get it from?
> thanks

any redhat mirror? 

search the appropriate rpm with rpmfind
(http://www.rpmfind.net/) it should be something
like kernel-2.4.18-3.src.rpm for the actual SRPM
which produces (if rebuilt) kernel-2.4.18-3.i386.rpm
(the kernel rpm) and kernel-source-2.4.18-3.i386.rpm
(the kernel sources, already patched)

best,
Herbert

> -----Original Message-----
> From: John DeFranco [mailto:defranco@cup.hp.com]
> Sent: Thursday, May 15, 2003 12:14 PM
> To: linux-lvm@sistina.com; Murray, Bobby
> Subject: Re: [linux-lvm] Question when installing LVM
> 
> 
> Hi,
> 
> If you are building a newer version of lvm from source for redhat 7.3 
> (there is one already compiled and provided as a module), you  need 
> to be sure you have the kernel-source rpm installed. Since redhat 
> uses /usr/src/linux-2.4 instead of /usr/src/linux as the kernel 
> source base you either need to create the /usr/src/linux link 
> yourself or when you run the LVM configure command use the option 
> --with-kernel_dir=/usr/src/linux-2.4, this is what I do.
> 
> I have had no problems with lvm on rh7.3.
> 
> On Thursday 15 May 2003 08:57, Murray, Bobby wrote:
> > I installed the LVM on Redhat Linux 7.3. I am not able to display
> > anything when I do a vgdisplay or lvdisplay. Nothing seems to work.
> > I was trying to compile the source but the configure is failing on
> > a /usr/src/src/linux not found. Redhat does not have such a file
> > thats why I turned to the RPM's but they do not seem to be working
> > correctly. Has anyone else experienced any problems compiling or
> > using LVM? thanks in advance
> >
> > Bobby Murray
> > Unix Administrator / AIX Certified Specialist
> >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> John DeFranco			Hewlett-Packard Company
> john.defranco@hp.com		Availability Clusters Solution Division
> phone: 408-447-7543		19111 Pruneridge Ave, M/S 4101
> fax: 408-447-0056		Cupertino, CA 95014 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
