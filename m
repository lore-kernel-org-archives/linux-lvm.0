Date: Tue, 22 Sep 2009 23:27:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] grow lv bug
Message-ID: <20090922222745.GA3866@agk-dp.fab.redhat.com>
References: <200909220808.16458.whobedobe@dodo.com.au>
	<200909222316.02416.whobedobe@dodo.com.au>
	<20090922132330.GO1210@agk-dp.fab.redhat.com>
	<200909230755.09752.whobedobe@dodo.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200909230755.09752.whobedobe@dodo.com.au>
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
To: Hugh <whobedobe@dodo.com.au>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Sep 23, 2009 at 07:55:09AM +1000, Hugh wrote:
> Yes I did. I used --setphysicalvolumesize
> it responded that it was successful.

Without any warning messages?

From the man page:

      --setphysicalvolumesize size
	Overrides  the  automatically-detected size of the PV.  Use with
	care, or prior to reducing the physical size of the device.

If you change the physical size of the device, it detects the new size
automatically and you don't need that argument.  But that argument instructs
LVM to pretend the device is some size other than the one it really is...

Maybe we should require --force as well and add a 'Please confirm you
know what this actually does' prompt.

Alasdair
