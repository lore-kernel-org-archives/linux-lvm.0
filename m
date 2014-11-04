Message-ID: <545893A6.2020503@redhat.com>
Date: Tue, 04 Nov 2014 09:51:50 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAHDsjKtjVuOVsEtzPpt-7x8BV1ficT7RQb5TVyUenutnuAnqMw@mail.gmail.com>
In-Reply-To: <CAHDsjKtjVuOVsEtzPpt-7x8BV1ficT7RQb5TVyUenutnuAnqMw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Volume "avg/alv" is not active locally.
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
To: daniel.savard@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 11/04/2014 02:15 AM, Daniel Savard wrote:
> Hi,
> 
> I am running LVM2 on linux (Gentoo) with systemd and dracut. I ran into
> a problem I am unable to find the cause.
> 
> I am trying to create a LV and I received an error as per the subject of
> this post.
> 
> For example:
> 
> feynman ~ # lvcreate -a y --contiguous y --size 1G --name db2data
> donneesvg   Volume "donneesvg/db2data" is not active locally.
>   Aborting. Failed to wipe start of new LV.
> 
> What is going on? Any hints? What does it mean "not active locally"?

LVM tries to wipe the LV - zero out first 4KiB of data and also any old
signatures it may find on any newly created LV for it to be properly
initialized.

But this LV has not been activated. One reason may be that you have
activation/volume_list set in LVM configuration (/etc/lvm/lvm.conf)
and it does not include the name of the LV you're just creating.

The "lvcreate -vvvv ...." should provide more info on why the
activation has been skipped.

-- 
Peter
