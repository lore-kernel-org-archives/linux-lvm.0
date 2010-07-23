Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6N22gGw023179
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 22:02:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6N22Wlk029581
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 22:02:32 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6N22VtY016141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 22:02:32 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o6N22Vh4007569
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2010 22:02:31 -0400
Date: Thu, 22 Jul 2010 22:02:31 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTiks7RESsKs1Qjs-P67suhY3tP8lc6ERFfUfjKwZ@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1007222159180.7363@bmsred.bmsi.com>
References: <AANLkTikwNhMWtusJHicMya9k5IS9geQ17ss4aHurjm4z@mail.gmail.com>
	<20100721185404.GA14889@bdmcc-us.com>
	<AANLkTiks7RESsKs1Qjs-P67suhY3tP8lc6ERFfUfjKwZ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 22 Jul 2010, Ken Bass wrote:

> Next I found a whole lot of audio type files, tagged with ID3. But that was
> all of the information "file" could give. Is there a utility to read ID3
> tags and generate a file name from it? I seem to remember I had many GBs of
> mp3's, flac's, ape's, etc.,  and that would be a real tedious pain to try to
> recognize and rename all of them :-(.

The id3lib package provides id3info, which displays id3 tags.  There
are probably more modern packages, but that is what I use.  You can
automate naming the MP3 files using that in a script.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
