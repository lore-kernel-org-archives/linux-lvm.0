Date: Thu, 21 Aug 2014 18:20:27 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140821172027.GE26374@agk-dp.fab.redhat.com>
References: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F1@XCH11.scidom.de>
	<20140820155010.GC23914@agk-dp.fab.redhat.com>
	<15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F3@XCH11.scidom.de>
	<CAAMCDeeuinHwSho0GbZHpChKv9Z1M=TkO2FbwccUyEv_30EnqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAMCDeeuinHwSho0GbZHpChKv9Z1M=TkO2FbwccUyEv_30EnqA@mail.gmail.com>
Subject: Re: [linux-lvm] problem with lvcreate and redirection
	of	stdout/stderr
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
To: Roger Heflin <rogerheflin@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Aug 21, 2014 at 11:57:51AM -0500, Roger Heflin wrote:
> I can see how with the vg suspended that might have a problem.
 
But nothing should be getting written to stderr while the device is suspended.

Alasdair
