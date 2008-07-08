Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m68Ee74x008878
	for <linux-lvm@redhat.com>; Tue, 8 Jul 2008 10:40:07 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.245])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m68Edvsx005060
	for <linux-lvm@redhat.com>; Tue, 8 Jul 2008 10:39:57 -0400
Received: by an-out-0708.google.com with SMTP id d31so555542and.124
	for <linux-lvm@redhat.com>; Tue, 08 Jul 2008 07:39:56 -0700 (PDT)
Message-ID: <a9e5040807080739m6dab9cd2ye344b9c446f8e85@mail.gmail.com>
Date: Tue, 8 Jul 2008 10:39:56 -0400
From: "Rob West" <robertfwest@gmail.com>
In-Reply-To: <a9e5040807011410q485a3a4bkebe7c684301b865d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2613_27886554.1215527996648"
References: <a9e5040807011410q485a3a4bkebe7c684301b865d@mail.gmail.com>
Subject: [linux-lvm] Re: Is it possible to invalidate snapshots other than
	by overfilling?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_2613_27886554.1215527996648
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Just wanted to let anyone that was following this thread know that it _did_
turn out to be overfilling. There was an rsync to the origin that no one
mentioned until late last week.

- Rob

On Tue, Jul 1, 2008 at 5:10 PM, Rob West <robertfwest@gmail.com> wrote:

> The reason I ask is that we're having cases where a snapshot is becoming
> invalid, but we are very skeptical that it is due to overfilling.

------=_Part_2613_27886554.1215527996648
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Just wanted to let anyone that was following this thread know that it _did_ turn out to be overfilling. There was an rsync to the origin that no one mentioned until late last week.<br><br>- Rob<br><br><div class="gmail_quote">
On Tue, Jul 1, 2008 at 5:10 PM, Rob West &lt;<a href="mailto:robertfwest@gmail.com">robertfwest@gmail.com</a>&gt; wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
The reason I ask is that we&#39;re having cases where a snapshot is becoming invalid, but we are very skeptical that it is due to overfilling. </blockquote></div><br>

------=_Part_2613_27886554.1215527996648--
