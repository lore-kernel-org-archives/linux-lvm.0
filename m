Date: Thu, 13 Jul 2017 22:05:14 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <74062471.20170713220514@marki-online.net>
In-Reply-To: <4577d764-d6bb-723f-086a-20c004e68a36@redhat.com>
References: <55f9c8eb-41df-8b3b-c790-e81fbcef0a73@meduniwien.ac.at> 
	<4577d764-d6bb-723f-086a-20c004e68a36@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] convert LV to physical device _in_place_?
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, Matthias Leopold <matthias.leopold@meduniwien.ac.at>

Hello Zdenek,

Thursday, July 13, 2017, 17:25:10, you wrote:

> However if you have been having a single 'segment' LV and and you calculate
> proper skipping offset (typically 1MB) you can try to use such device directly
> without lvm2 with a loop device mapping -  see losetup --offset option - but
> you would need to use this everytime you want to access such storage - so
> there is not a single magic 'flip' which would make an LV to appear like
> regular device.

Wouldn't creating a partition with correct start sector work as a permanent
solution? (Although I didn't understand if using a partition is an
option for the original poster.)

-- 
  bYE, Marki
