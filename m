Message-ID: <5204D719.2060304@redhat.com>
Date: Fri, 09 Aug 2013 13:48:41 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAGDaZ_pgnZeWHrGO3_fQK92AQnoApGuf2Lq6rGNEGngf9p=UrA@mail.gmail.com>
	<52034E72.7050403@redhat.com> <52034F2A.1000608@redhat.com>
	<52034FEF.7070102@redhat.com>
	<CAGDaZ_qmdYDqaAGCfmLnnzppncm9eWbKko+sKOZFkg0ctVX2rg@mail.gmail.com>
In-Reply-To: <CAGDaZ_qmdYDqaAGCfmLnnzppncm9eWbKko+sKOZFkg0ctVX2rg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Weird errors after fresh install
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
Cc: Raymond Jennings <shentino@gmail.com>

On 08/09/2013 02:33 AM, Raymond Jennings wrote:
> If and when you guys post a bug report with gcc, could you post a copy
> of it here?
> 
> I plan to follow the bug myself

So finally we get to the source of the problem.
It's reported here:
https://bugzilla.redhat.com/show_bug.cgi?id=995446

The workaround we provide is to not use the "static"
qualifier for the string that is malformed by that bug
(and hence the optimizer is not touching it that much):

https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=2f61478436a7ebe058ffad3f92e1c4dada0805d0

I'll update F19 shortly.

Peter
