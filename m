Return-Path: <jan@gondor.com>
Date: Thu, 1 Mar 2001 22:23:33 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] online resize of ext2
Message-ID: <20010301222333.A2800@gondor.com>
References: <B45465FD9C23D21193E90000F8D0F3DF68399D@mailsrv.linkvest.com> <200102211725.f1LHPPv31859@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200102211725.f1LHPPv31859@webber.adilger.net>; from adilger@turbolinux.com on Wed, Feb 21, 2001 at 10:25:24AM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Wed, Feb 21, 2001 at 10:25:24AM -0700, Andreas Dilger wrote:
> Any other ext2online users out there?

Yes, I've been using it for some time without problems. (I had some 
problems in 2.3.x, but they were probably caused by an unrelated bug
that got triggered by the online-resize)

I actually did things like resizing a fs while copying to it or compiling
things on it, because I realised that the partition was to small to 
complete the job without resizing.

Jan

-- 
OpenPGP-signierte bzw. -verschl�sselte Mail erw�nscht
EMail-Key: 1024D/F12DA065 (=> Keyserver oder auf Anfrage)
