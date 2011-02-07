Message-ID: <4D4FE562.9050705@redhat.com>
Date: Mon, 07 Feb 2011 12:28:18 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <2BF070A7A2375D46BA1B6087F8D5DCB678B8E77247@seldmbx01.corpusers.net>
In-Reply-To: <2BF070A7A2375D46BA1B6087F8D5DCB678B8E77247@seldmbx01.corpusers.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvdisplay shows misleading information about used
 devices
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Assarsson, Emil" <Emil.Assarsson@sonyericsson.com>

On 02/07/2011 10:51 AM, Assarsson, Emil wrote:
> Hi,
> 
> pvdisplay doesn't show the actual used devices based on the device mapper. It
> seems to base the information on the cache file and that is misleading. If
> there is something wrong with the setup it doesn't show. I consider this to
> be a bug. I had to learn about "dmsetup ls --tree" to find out what was
> wrong.
> 
> (I have configured LVM filter to only accept mpath or local disk now and it
> is working like it should.)
> 
> Best regards

Can you post some examples so that readers can be sure that they're seeing the
same thing that you're reporting?

Regards,
Bryn.
