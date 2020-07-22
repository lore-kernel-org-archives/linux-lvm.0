Date: Wed, 22 Jul 2020 01:39:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20200722003954.GJ6740@agk-dp.fab.redhat.com>
References: <CALOnQv5gib+tQTBzZBD9QDDNiZcuoybN3HoH_wQVD8rAdsMQKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALOnQv5gib+tQTBzZBD9QDDNiZcuoybN3HoH_wQVD8rAdsMQKA@mail.gmail.com>
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

On Tue, Jul 21, 2020 at 05:23:47PM -0700, L A Walsh wrote:
> I have a file in the /etc/lvm/archive dir that seems to be the name of a vg.
 
Use the tools to explain what you have where:
  pvs, lvs, vgs 
with -o help to see the list of fields available
and --units to select your choice of output units.

(Offset from start of disk and extent size is recorded as 512-byte sectors;
Within VGs units are extents.)

Alasdair
