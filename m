Subject: Re: [linux-lvm] Snapshots problem
Content-Type: multipart/alternative; boundary=Apple-Mail-3-421497440
Mime-Version: 1.0 (Apple Message framework v552)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
In-Reply-To: <003301c334b5$53d50460$e601010a@h17119.findquick.com>
Message-Id: <66E851F1-A26E-11D7-8E22-0003937830E4@mac.com>
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
Date: Fri Jun 20 09:30:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Apple-Mail-3-421497440
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed


On Tuesday, June 17, 2003, at 05:46  AM, beboy wrote:

> Hello All,
>
> I have a strange issue of the snapshots on my Linux machine. Currently 
> my Linux version is 2.4.18-snap.clipper. I have two snapshots are 
> shown as ORPHAN which cannot be deleted (another thing is their date 
> are shown as 'bogus' in snaptab). This causes the issue that all the 
> snapshots following them cannot be deleted also. Is there any forced 
> method can achieve my goal? Which command should I use and what kind 
> of document can be found on some web sites?
>
> Thanks,
> -Kevin
>
 From the Linux version and the mention of the snaptab, you must be 
using something from SnapAppliance.  Have you tried talking to customer 
support?  Snap uses my chained snapshot patch, which isn't part of the 
LVM1 cvs tree -- that's why the following snapshots can't be deleted, 
there's a snapshot depending on them.  For documentation, I'd also 
check SnapAppliance.

I can tell you that if you reboot the snapshots will almost certainly 
be deletable.  You should still talk to customer support, as they'll 
probably want your logs to find out what went wrong.

Dale J. Stephenson
dalestephenson@mac.com

--Apple-Mail-3-421497440
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=US-ASCII



On Tuesday, June 17, 2003, at 05:46  AM, beboy wrote:


<excerpt><fontfamily><param>Verdana</param><smaller>Hello All,</smaller></fontfamily>


<fontfamily><param>Verdana</param><smaller>I have a strange issue of
the snapshots on my Linux machine. Currently my Linux version is
2.4.18-snap.clipper. I have two snapshots are shown as ORPHAN which
cannot be deleted (another thing is their date are shown as 'bogus' in
snaptab). This causes the issue that all the snapshots following them
cannot be deleted also. Is there any forced method can achieve my
goal? Which command should I use and what kind of document can be
found on some web sites?</smaller></fontfamily>


<fontfamily><param>Verdana</param><smaller>Thanks,

-Kevin</smaller></fontfamily>


</excerpt>From the Linux version and the mention of the snaptab, you
must be using something from SnapAppliance.  Have you tried talking to
customer support?  Snap uses my chained snapshot patch, which isn't
part of the LVM1 cvs tree -- that's why the following snapshots can't
be deleted, there's a snapshot depending on them.  For documentation,
I'd also check SnapAppliance.


I can tell you that if you reboot the snapshots will almost certainly
be deletable.  You should still talk to customer support, as they'll
probably want your logs to find out what went wrong.


Dale J. Stephenson

dalestephenson@mac.com


--Apple-Mail-3-421497440--
