From: neuron <neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
Message-Id: <20031117175136.67d3196f.neuron@hollowtube.mine.nu>
In-Reply-To: <3FB8F8A1.1060004@clin.ucl.ac.be>
References: <20031114132620.5e261cc3.neuron@hollowtube.mine.nu>
	<3FB8F8A1.1060004@clin.ucl.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Nov 17 10:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

2 120gb western digital 8mb cache, and one 80gb.

also got another 120gb here I'm gonna add.

500mhz athlon, 512mb memory.

gonna test 2.6 kernel now, will have to be compatibility with my old disks though, can't recreate the entire thing.

> what is your hardware config, mainly for disks ?
> in the if I use LVM on top of ide disks some big file transfert, like 
> ftp tar ..., the system hang  during the file manipulation.
> when moving the same config on SCSI disk I never see this situation.
> 
> My config is soft raid1 + lvm + ext3 fs
> 
> JL
> 
> neuron wrote:
> 
> >I've had lvm running on my server for quite a while now, not sure if this problem has always been there, or if it just occured.
> >
> >If I through smb listen to music, and then on the server rm a file about 500mb in size, the music will stop.  Now this is just an example, it's like the entire filesystem stops while removing the file.  Running reiserfs ontop of lvm.  Also, when copying through ftp/smb from the server, I max on about 6mb/sec, which is far from the 12.1mb/sec avrange I've gotten out of that network card before (on a slower computer).
> >
> >Any suggestions on how to improve performance?
> >
> >(I realize more information is probably preferable, so just tell me what info you would need, as I'm not really skilled with lvm (= I also don't have anything fancy like a fake raid running)).
> >
> >neuron
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >  
> >
> 
> -- 
> Enthusiasm continues to make the difference !
> 
> *********************************************************************
> Jean-Louis Matton                     Cliniques universitaires St LUC
> tel        +32.2.764.37.13                     av. Hippocrate 10/ SIH
> fax        +32.2.764.89.22                     B-1200 Bruxelles
> Jean-Louis.Matton@clin.ucl.ac.be               BELGIUM
> www.saintluc.be
> *********************************************************************
>                                           
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
