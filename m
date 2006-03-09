Date: Thu, 9 Mar 2006 14:31:01 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM2 on a USB-disk/ same VG name
Message-ID: <20060309133101.GB16@redhat.com>
References: <20060309094605.GA3222@redhat.com>
	<21543.1141908936@www029.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21543.1141908936@www029.gmx.net>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Axel Braun <Axel.Braun@gmx.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, mauelshagen@redhat.com

On Thu, Mar 09, 2006 at 01:55:36PM +0100, Axel Braun wrote:
> Hello Heinz,
> 
> > vgrename the active one and adjust /etc/fstab appropriately.
> > 'vgscan;vgchange -ay' should gain you access to the USB one then.
> 
> After deactivation I could change the name, but after the reboot the
> dm-mapper was still looking for the old volume group 'system'. I tried to
> boot the rescue system, maybe the inittab needed a refresh - but that did
> not work.

Did you change /etc/fstab ?

Heinz

> unfortunately Suse's system repair cant deal with LVM, so my best idea was
> to  change everything back. 
> 
> Cheers
> Axel
> 
> -- 
> Echte DSL-Flatrate dauerhaft f?r 0,- Euro*!
> "Feel free" mit GMX DSL! http://www.gmx.net/de/go/dsl

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
