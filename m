Date: Mon, 19 Jan 2015 22:21:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20150119222134.GA17599@agk-dp.fab.redhat.com>
References: <CAPWkaSVZEeL6yP+3ax2Z0Z7iMJQezEGUvVOXZ8PUrA7ytEeA=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPWkaSVZEeL6yP+3ax2Z0Z7iMJQezEGUvVOXZ8PUrA7ytEeA=w@mail.gmail.com>
Subject: Re: [linux-lvm] Slow response from lvs and vgs commands
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
To: John Griffith <john.griffith8@gmail.com>
Cc: linux-lvm@redhat.com

On Mon, Jan 19, 2015 at 02:05:39PM -0700, John Griffith wrote:
> I'm wondering if there's something I should be looking at more closely
> to debug this, or if there's a way to filter the lvs and vgs commands
> to make them more efficient?
 
Add -vvvv to the command lines and see if that helps you to see
where the slowness is.

Alasdair
