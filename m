Date: Wed, 30 Jun 2010 21:57:29 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100630205728.GR23989@agk-dp.fab.redhat.com>
References: <180678.70848.qm@web120413.mail.ne1.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <180678.70848.qm@web120413.mail.ne1.yahoo.com>
Subject: Re: [linux-lvm] when to vgscan/pvscan/lvscan
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
To: Philippe Cerfon <philcerf@yahoo.com>
Cc: linux-lvm@redhat.com

The code is supposed to auto-detect changes, but there are still
(mostly obscure) ways that confuse it.

The safest approach if you want to remove the vgscan at boot is to
specify the precise VGs you want to activate by name on the vgchange
command line instead of letting it default to 'all'.

So 'vgchange -ay root_vg home_vg' etc. instead of 'vgchange -ay'.

Then it knows what VGs are supposed to be there, and if it didn't think
it needed to scan but doesn't see one or more of them that'll be enough
to trigger the scan.

Alasdair
