Message-Id: <200112181350.fBIDoPG13323@lewis.abi.tconline.net>
From: Lewis Bergman <lbergman@abi.tconline.net>
Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
References: <Pine.LNX.4.33.0112180820400.22382-100000@dragon.inside.ntisys.com>
In-Reply-To: <Pine.LNX.4.33.0112180820400.22382-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Dec 18 07:50:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tuesday 18 December 2001 07:22 am, you wrote:
> On 17 Dec 2001, Bradley Alexander wrote:
> > Swapped controllers (was originally on the first controller with the
> >    other drive, now on the second.)
Seems strange since so many of us have not had any problems with LVM. Have 
you looked at the kernel notes for any clues to your particular hardware? You 
may find that some controllers/drives/PIO modes do not work together. Further 
tuning with hdparam may alleviate the problem.
As for myself. I wouldn't put much that is important on a Quantum as the 
quality seems to be fading. I have gone to IBM exclusively. Prices are good 
and I don't know of any better drive out there for ide or scsi.
-- 
Lewis Bergman
Texas Communications
4309 Maple St.
Abilene, TX 79602-8044
915-695-6962 ext 115
