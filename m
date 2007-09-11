Received: from redhat.com (astrea.boston.redhat.com [172.16.80.45])
	by mail.boston.redhat.com (8.13.1/8.13.1) with ESMTP id l8BEeRds013523
	for <linux-lvm@redhat.com>; Tue, 11 Sep 2007 10:40:27 -0400
Message-ID: <46E6A8DB.6040802@redhat.com>
Date: Tue, 11 Sep 2007 10:40:27 -0400
From: James Parsons <jparsons@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Any exiisting users of existing LVM2 command line
	library interface (lvm2cmd.h)?
References: <1189521146.4451.17.camel@linux-cxyg>
In-Reply-To: <1189521146.4451.17.camel@linux-cxyg>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dave Wysochanski wrote:

>A new LVM2 API library is in progress.
>
>If you are an existing user of the current command line library
>interface or are interested in a new LVM2 library, we're interested to
>hear input:
>1) how you are currently using the existing interface
>2) what you would like to see in the new interface
>
>Thanks. 
>
>_
>
I maintain the gnome graphical tool for lvm called system-config-lvm, as 
well as a web based lvm configuration tool called conga. I depend on the 
current command line set to make the app work. Will the rug soon be 
pulled out from under me? :)

No big deal, as long as I have a little warning - like a quarter, or so. 
As you amend the CLI, though, please maintain the 'machine readable' 
output commands...ones without column headers or unnecessary formatting 
characters, so that my app, and the many, many users that have built 
scripts around the CLI are not confronted with surprises.

Maintaining compatibility with the current CLI for a few releases of the 
new CLI would be a nice gift to us!

Regards,

-Jim
