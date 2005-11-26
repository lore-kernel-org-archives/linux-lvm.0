Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAQ5f7V31369
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 00:41:07 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.207])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAQ5f4kh004912
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 00:41:05 -0500
Received: by xproxy.gmail.com with SMTP id h26so955645wxd
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 21:40:04 -0800 (PST)
Message-ID: <80d985600511252130j37b17586i9dd1649a958622ba@mail.gmail.com>
Date: Sat, 26 Nov 2005 14:30:04 +0900
From: Craig Hagerman <craighagerman@gmail.com>
Subject: Re: [linux-lvm] One of 8 PVs dead - Trying to rescue data from
	remaining 7
In-Reply-To: <4365F0AC.3090909@oxtel.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <4365F0AC.3090909@oxtel.com>
Content-Transfer-Encoding: 8bit
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

On 10/31/05, Tom Robinson <tom.robinson@oxtel.com> wrote:
>
> Summary: One of my 8 PVs is dead and I despirately need to rescue
> the data from the other 7, even if its just read-only is fine, as
> long as I can see it.
>

Tom, did you ever get this figured out? (I don't see any responses on
the mailing list.) If so what did you do?

I am curious about what to do in general if I have one disc fail on a
multi-LVM system. Personally I have a two disc LVM system. You problem
made me realize I have no idea what to do to recover data if one of
the discs has a problem. Anyone have the answer?

Craig
