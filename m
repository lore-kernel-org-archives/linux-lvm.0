From: Christoph Resch <mailing-oit@tttech.com>
Subject: Re: [linux-lvm] Dual Boot with LVM
References: <200312111402.11063.mailing-oit@tttech.com> <200312171234.34785.mailing-oit@tttech.com>
In-Reply-To: <200312171234.34785.mailing-oit@tttech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200312171247.26243.mailing-oit@tttech.com>
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
Date: Wed Dec 17 05:48:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

ok .. according to the 'devfs'-issue i found out to not have a identical /dev 
on the initrd and on the system 

after sync it all works perfectly again :-) 

thanks anyway

-c-

Am Mittwoch 17 Dezember 2003 12:34 schrieb Christoph Resch:
> Hi Jord,
>
> i can see the same behavior on my LVM-Installation, though i dont
> dual-boot. i get this strange situation after preparing for
> disaster-recovery with mondo-rescue .. since then my first PV is always
> inactive, but i can boot from it and work normally ...
>
> did you found something ? .. maybe a lvm-version problem -- on debian i use
> lvm-common	1.5.9.3
> lvm10 		1.0.7-8
>
> thanks for reply
>
> -c-
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
