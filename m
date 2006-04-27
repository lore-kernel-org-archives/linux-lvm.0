Message-ID: <44502764.7010805@coverity.com>
Date: Wed, 26 Apr 2006 19:07:32 -0700
From: Matthew Hayward <mhayward@coverity.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Coverity Open Source Scan of LVM2
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
To: linux-lvm@redhat.com, agk@redhat.com

Hello LVM2 Developers,

As some of you may have heard, last month Coverity set up
http://scan.coverity.com as a site dedicated to scanning open source
projects for defects.  In just 1 month, over 4500 defects have been
examined by various open source developers, and from what we can tell,
it seems that there have been over 2500 patches to the scanned code
bases!

Due to popular request, I'm happy to announce that we've added LVM2 to
the list of projects scanned on the site.  Thanks to all those who
requested additional projects, your suggestions have allowed us to
scan over 50 projects to date with more on the way.

For those of you not familiar with "scan" yet and by way of
introduction, allow me to forward you this note from Ben Chelf,
Coverity's CTO:

-- Start forward --


I'm the CTO of Coverity, Inc., a company that has technology that
performs static source code analysis to look for defects in code. You
may have heard of us or of our technology from its days at Stanford
(the "Stanford Checker"). The reason I'm writing is because we have
set up a framework internally to continually scan open source projects
and provide the results of our analysis back to the developers of
those projects. To see the results of the project, check out:

http://scan.coverity.com
 
My belief is that we (Coverity) must reach out to the developers of
these packages (you) in order to make progress in actually fixing the
defects that we happen to find, so this is my first step in that
mission. Of course, I think Coverity technology is great, but I want
to hear what you think and that's why I worked with folks at Coverity
to put this infrastructure in place. The process is simple -- it
checks out your code each night from your repository and scans it so
you can always see the latest results.

Right now, we're guarding access to the actual defects that we report
for a couple of reasons: (1) We think that you, as developers of LVM2,
should have the chance to look at the defects we find to patch them
before random other folks get to see what we found and (2) From a
support perspective, we want to make sure that we have the appropriate
time to engage with those who want to use the results to fix the code.

Because of this second point, I'd ask that if you are interested in
really digging into the results a bit further for your project, please
have a couple of core maintainers and/or developers reach out to us to
request access. As this is a new process for us and still involves a
small number of packages, I want to make sure that I personally can be
involved with the activity that is generated from this effort.

So I'm basically asking for people who want to play around with some
cool new technology to help make source code better. If this interests
you, please feel free to register on our site or email me
directly. And of course, if there are other packages you care about
that aren't currently on the list, I want to know about those too.

If this is the wrong list, my sincerest apologies and please let me
know where would be a more appropriate forum for this type of message.

Many thanks for reading this far...

-ben

Ben Chelf
Chief Technology Officer
Coverity, Inc.

-- End forward --

-- 
Matthew Hayward
Senior Service Engineer
mhayward@coverity.com
