From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] vgscan goes into an infinite loop (migration issues)
Message-ID: <20040106232904.M21022@uk.sistina.com>
References: <20040106165719.A26553@cs.mcgill.ca> <20040106225901.J21022@uk.sistina.com> <20040106181311.B26794@cs.mcgill.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040106181311.B26794@cs.mcgill.ca>; from navindra@cs.mcgill.ca on Tue, Jan 06, 2004 at 06:13:11PM -0500
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
Date: Tue Jan  6 17:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 06, 2004 at 06:13:11PM -0500, Navindra Umanee wrote:
> PV UUID               none

LVM2 uses the UUID to distinguish between PVs - so it sees all the
devices as duplicates of each other.

I'll try to change the code so it generates a UUID if it's missing.
 
Alasdair
-- 
agk@uk.sistina.com
