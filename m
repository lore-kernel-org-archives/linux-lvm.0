Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3EIHpYJ015332
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 14:17:51 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.234])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3EIHd2x019002
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 14:17:39 -0400
Received: by wr-out-0506.google.com with SMTP id c57so902431wra.9
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2008 11:17:38 -0700 (PDT)
Message-ID: <a71bd89a0804141117i4f73fc5q8a7df8fc6ea33b47@mail.gmail.com>
Date: Mon, 14 Apr 2008 11:17:38 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] merge an lvm snapshot back
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93857F239C1AF@an-ex.ActiveNetwerx.int>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1C8CF1EA1A5B5940B81B0710B2A4C93857F239C1AF@an-ex.ActiveNetwerx.int>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Apr 14, 2008 at 11:10 AM, Joseph L. Casale
<jcasale@activenetwerx.com> wrote:
> Looking through the archives, I see some mention of this.
> Is there any progress on this functionality and is intended to be included in a release any time soon?

For what it's worth, we implemented revert-to-snapshot in the latest
release of zumastor,
http://zumastor.org/
That's not LVM, so this is kind of off-topic, but if you really want
that feature, zumastor is one way to get it.

What's your use case?
- Dan
