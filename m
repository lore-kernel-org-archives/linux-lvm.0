Return-Path: <josv@osp.nl>
Date: Wed, 28 Mar 2001 10:30:09 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] alternate pathing with lvm?
Message-ID: <20010328103009.D749@jadzia.azm.nl>
References: <sac1a0ae.076@lvnbb.brandenburg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sac1a0ae.076@lvnbb.brandenburg.de>; from Stephan.Hendl@lds.brandenburg.de on Wed, Mar 28, 2001 at 08:27:53AM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

The Linux LVM does not currently support alternate pathing (or, as HP
calls it, alternate PV links). LinuxCare did some work on a generic SCSI
alternate pathing feature for the Sun S3 StorEdge arrays (see the
LinuxCare web site for more info on this). I have been giving some
thought to implementing alternate pathing on the "md" level. Basically,
the lower it is implemented in the driver stack, the more generic and
useful it is. I do not know whether alternate pathing is in Sistina's
(or anyone's) roadmap, but it sure would be a cool feature!

++Jos

And thus it came to pass that Stephan Hendl wrote:
(on Wed, Mar 28, 2001 at 08:27:53AM +0200 to be exact)

> Hi all,
> 
> following the discussions in last June and Hovember, resp. I want to ask oncemore wether there is an alternate pathing with the linux-lvm possible or not. We are using several HP MC/SG-Cluster and want to implement an Linux-Cluster with the RadHat Cluster Software too. In the backend there is a HP XP512 and a SAN; the Linuxserver shell be connected to the Storagebox via two FC-HBAs (like the HP servers are). We do not need an online load balancing, all we want is to have a feature for continous work during firmwareupdates, configuration works on FC-switches and so on.
> 
> regards
> Stephan
> 
> 
> --
> LDS Brandenburg
> Dr. Stephan Hendl
> fon: +49-(0)331-39 471
> fax: +49-(0)331-27548 1187
> EMail: stephan.hendl@lds.brandenburg.de
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
assert(heaven.isMissing(anAngel));
