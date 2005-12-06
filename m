Date: Tue, 6 Dec 2005 11:56:00 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Dumb LVM question
Message-ID: <20051206105600.GB2778@redhat.com>
References: <87f94c370512010752n6f4b311eqe8ff0b2c8bd92f4f@mail.gmail.com>
	<87f94c370512051029uc354fadw1921ec2ff72cbbe5@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87f94c370512051029uc354fadw1921ec2ff72cbbe5@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com

On Mon, Dec 05, 2005 at 01:29:23PM -0500, Greg Freemyer wrote:
> All,
> 
> With LVM 2, how do I kill any and all snapshots.
> 
> With LVM 1 it was "vgscan -r".
> 
> I need to be able to do this with a script, so I'm hoping lvm 2 has a
> way to kill all snapshots without knowing their names, etc.  If not, I
> guess I can script up something to do the job.

Yes, you could use something like:

<quick_hacking_mode>
lvs|perl -ne '@a = split /\s+/,$_;if ($a[3] =~ /^s/) {print "/dev/$a[2]/$a[1]\n";}'|xargs lvremove -f
</quick_hacking_mode>


> 
> Greg
> --
> Greg Freemyer
> The Norcross Group
> Forensics for the 21st Century
> 
> 
> --
> Greg Freemyer
> The Norcross Group
> Forensics for the 21st Century
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
