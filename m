Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBCHZxr19011
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 12:35:59 -0500
Received: from einhorn.in-berlin.de (root@einhorn.in-berlin.de [192.109.42.8])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBCHZp8O005764
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 12:35:52 -0500
Received: from x-berg.in-berlin.de (x-berg.in-berlin.de [192.109.21.10])
	by einhorn.in-berlin.de (8.12.10/8.12.10/Debian-4) with ESMTP id
	iBCHZn7f021514
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 18:35:49 +0100
Received: from philipp by x-berg.in-berlin.de with local (Exim 4.34)
	id 1CdXdN-0005CX-7j
	for linux-lvm@redhat.com; Sun, 12 Dec 2004 18:35:49 +0100
Date: Sun, 12 Dec 2004 18:35:49 +0100
From: Philipp Schmidt <philipp@ppc.in-berlin.de>
Subject: Re: [linux-lvm] duplicate pv.
Message-ID: <20041212173549.GC3853@ppc.in-berlin.de>
References: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
	<20041211131829.GA10829@ppc.in-berlin.de>
	<20041211223855.GJ11338@agk.surrey.redhat.com>
	<20041212171230.GL11338@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041212171230.GL11338@agk.surrey.redhat.com>
Sender: Philipp Schmidt <philipp@x-berg.in-berlin.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

On 2004-12-12 17:12:30 +0000, Alasdair G Kergon <agk@redhat.com>
wrote in <20041212171230.GL11338@agk.surrey.redhat.com>:
> On Sat, Dec 11, 2004 at 10:38:56PM +0000, Alasdair G Kergon wrote:
> > On Sat, Dec 11, 2004 at 02:18:29PM +0100, Philipp Schmidt wrote:
> > > look t your /etc/lvm/lvm.conf, have you set md_component_detection = 1?
> > > i wonder why this isn't set by default, who needs to use md compnents as
> > > singel pv?
> > It *is* set to 1 by default i.e. if you don't specify 
> > a different value for it in the conf file.
>  
> I believe the Debian distribution may have set it to 0 at one point because
> of problems in certain configurations: these cases should be fixed by 2.00.29.

ok, i use debian here and it had cost me one day to find this bad default
config... 

AVE!
  phils...

-- 
   {phils}--->---(mail: philipp@ppc.in-berlin.de)-->--(ircnet: phils)--,
    wenn w eine   aube ist dn      man au dran dre en                   |
         o     Schr        an muss     hc         h   (Kurt Schwitters) |
:wq!    <--(phone: +49-179-6737439)--<--(jabber: phils@jabber.ccc.de)--'
