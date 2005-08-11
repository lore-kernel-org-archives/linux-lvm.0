Date: Thu, 11 Aug 2005 18:27:21 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] ghostlike error on logical volume on raid1
Message-ID: <20050811172721.GH5087@agk.surrey.redhat.com>
References: <200508111906.11974.dirk.jakobsmeier@web.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200508111906.11974.dirk.jakobsmeier@web.de>
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
To: dirk.jakobsmeier@web.de
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Aug 11, 2005 at 07:06:10PM +0200, Dirk Jakobsmeier wrote:
> I use a kernel.org kernel 2.6.12 on a SuSE 9.2. 

Try updating to latest 2.6.13-rc* which includes a fix to bio_clone.

Alasdair
