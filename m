Date: Tue, 24 Jul 2012 10:38:38 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120724143837.GB3772@redhat.com>
References: <CALVifsZrOo+D7nWpO3gKd87B1=Sn_F3PQy377etCb8p90=twow@mail.gmail.com>
	<CALVifsY2ZUNUZFEAUB1ASWbEXX_q3TP0g6aX60Te0A6D-8=+FA@mail.gmail.com>
	<20120724131517.GA3165@redhat.com>
	<CALVifsY0zh1YA214sMc9tU=ukd1VQWzYVnmnpPgScfNeSiF6Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALVifsY0zh1YA214sMc9tU=ukd1VQWzYVnmnpPgScfNeSiF6Dw@mail.gmail.com>
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
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Tue, Jul 24 2012 at 10:21am -0400,
Fred van Zwieten <fvzwieten@vxcompany.com> wrote:

> I agree, but that doesn't answer my questions ;-)

please don't top-post.

The old dm-snapshot cannot scale to 150 concurrent read-only
snaps.. sorry.

There would be a 150-way copy out to the 150 different COW areas.  Aka,
the dm-snapshot N-way copy-out penalty

thinp snapshots use a single shared pool for the COW area.
