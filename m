Date: Tue, 24 Jul 2012 09:15:17 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120724131517.GA3165@redhat.com>
References: <CALVifsZrOo+D7nWpO3gKd87B1=Sn_F3PQy377etCb8p90=twow@mail.gmail.com>
	<CALVifsY2ZUNUZFEAUB1ASWbEXX_q3TP0g6aX60Te0A6D-8=+FA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALVifsY2ZUNUZFEAUB1ASWbEXX_q3TP0g6aX60Te0A6D-8=+FA@mail.gmail.com>
Subject: Re: [linux-lvm] Snapshot limit?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred van Zwieten <fvzwieten@vxcompany.com>
Cc: linux-lvm@redhat.com

On Mon, Jul 23 2012 at  5:00am -0400,
Fred van Zwieten <fvzwieten@vxcompany.com> wrote:

> O, I forgot: I am using LVM2 on RHEL 6.3. That is LVM2 version 2.02.87.
> 
> Met vriendelijke groeten,
> *
> Fred van Zwieten
> *
> *Enterprise Open Source Services*
> *
> Consultant*
> *(vrijdags afwezig)*
> 
> *VX Company IT Services B.V.*
> *T* (035) 539 09 50 mobiel (06) 41 68 28 48
> *F* (035) 539 09 08
> *E* fvzwieten@vxcompany.com
> *I*  www.vxcompany.com
> 
> 
> 
> On Mon, Jul 23, 2012 at 10:52 AM, Fred van Zwieten
> <fvzwieten@vxcompany.com>wrote:
> 
> > Hi,
> >
> > I would like to know is there is a limit on the amount of snapshots one
> > can take from a single LV.
> >
> > I have a single LV with a very low changerate, but I have a retention
> > requirement of about 150 readonly snapshots for it. Is it is at all
> > possible, will there be a performance hit?
> >
> > Fred
> > **

You definitely want to make use of the snapshots provided via the new
thinp target (NOTE: thinp is still tech preview in RHEL6.3).
