Return-Path: <mason@suse.com>
Date: Fri, 05 Jan 2001 10:22:48 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [lvm-devel] Re: [linux-lvm] LVM 0.9 vgscan problem
Message-ID: <620160000.978708168@tiny>
In-Reply-To: <Pine.LNX.4.21.0101051308461.1295-100000@duckman.distro.conectiva>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Friday, January 05, 2001 01:10:22 PM -0200 Rik van Riel
<riel@conectiva.com.br> wrote:

> On Fri, 5 Jan 2001, Heinz J. Mauelshagen wrote:
> 
>> Rik, nobody was "sitting" on bugfixes. It just got fixed
>> recently and still needed some testing before making it into
>> 2.4.0.
> 
> Ahh I see...
> 
>> As I stated in my other email: Andrea Arcangeli's help to
>> integrate 0.9 into 2.4.0 brought it in. TTBOMK there was no
>> previous negotiation about 0.9 inclusion in 2.4.0 with us
>> before :-(
> 
> OUCH ... so LVM 0.9 got pushed into the kernel before you
> had a chance to do some serious testing ? ;(
> 

Yes and no.  I asked Heinz what was needed to include 0.9 on the next suse
release.  He gave me a short list of the known huge bugs, I fixed them and
sent the patches along to andrea.  Andrea picked up my merging patch into
his tree, but I wasn't clear enough about the bug fix patch and it was
missed.

And, I missed that it didn't get into the kernel until it was too late
(sorry Heinz).

-chris
