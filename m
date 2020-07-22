Date: Wed, 22 Jul 2020 03:37:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20200722023758.GK6740@agk-dp.fab.redhat.com>
References: <CALOnQv5gib+tQTBzZBD9QDDNiZcuoybN3HoH_wQVD8rAdsMQKA@mail.gmail.com>
	<20200722003954.GJ6740@agk-dp.fab.redhat.com>
	<CALOnQv7BfMKCXVV-ED+884RuxFWCEA0UOE79MqKExXLVn2YDpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALOnQv7BfMKCXVV-ED+884RuxFWCEA0UOE79MqKExXLVn2YDpw@mail.gmail.com>
Subject: Re: [linux-lvm] lvm question regarding start and placement of data
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
To: L A Walsh <lvm@tlinx.org>
Cc: linux-lvm@redhat.com

On Tue, Jul 21, 2020 at 05:47:07PM -0700, L A Walsh wrote:
> I don't think the tools work on bare disk (or disk images).  This is a

There are ways to do it, but download a recent upstream version and read
the pvck man page which now has extra analysis facilities.

> I'm beginning to wonder if this is a circular log since I can't really

Yes - see for example Metadata slides at
  http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/

Alasdair
