From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Performance problem.
Message-ID: <1631510000.1072589723@[192.168.200.4]>
In-Reply-To: <3FB8F8A1.1060004@clin.ucl.ac.be>
References: <20031114132620.5e261cc3.neuron@hollowtube.mine.nu>
 <3FB8F8A1.1060004@clin.ucl.ac.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sat Dec 27 23:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Jean-louis MATTON <Jean-Louis.Matton@clin.ucl.ac.be>

> what is your hardware config, mainly for disks ?
> in the if I use LVM on top of ide disks some big file transfert, like ftp
> tar ..., the system hang  during the file manipulation.
> when moving the same config on SCSI disk I never see this situation.
>
> My config is soft raid1 + lvm + ext3 fs

Have you had the same problem with ext3 on non-LVM/RAID
systems?


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 888 359 3508
