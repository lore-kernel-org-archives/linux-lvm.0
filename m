From: Axel Reinhold <axel@freakout.de>
Message-Id: <200401201848.i0KIm9iW017304@bongo.freakout.de>
Subject: Re: [linux-lvm] LVM2 migration on 2.4.24 troubles - prepare for 2.6
In-Reply-To: <20040119171824.S18942@uk.sistina.com> from Alasdair G Kergon at
 "Jan 19, 2004 05:18:24 pm"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Jan 20 17:06:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

According to Alasdair G Kergon:
> On Sat, Jan 17, 2004 at 10:06:11PM +0100, Axel Reinhold wrote:
> > Are there incompatibilities regarding snapshots with LVM1/2?
> 
> Yes - snapshots are implemented differently: the on-disk data
> is different.
> 
> Always drop snapshots before switching between LVM1 / LVM2.
> 

Dear Alasdair,

thanks for your answer.  I use snapshots intensively.  I
currently have 6 monthly, 5 weekly and 7 daily snapshots active
with a rotating algorithm.

Does the new implementation copy dirty blocks also in "all"
active snapshots or is it now possible to use the cow-blocks
"cross-snapshot"?  I mean that a new dirty block is only copied
into the oldest snapshot and all the other ones can use that one.
NetApp's Filer does it this way.

Regards
Axel Reinhold

- -- 
|------------------------+--------------------------------------|
| Axel Reinhold          | Fax:   +49-9287-8244                 |
| Franz-Heinrich-Str. 20 | eMail: axel@freakout.de              |
| 95100 Selb             | http://www.freakout.de               |
| Germany          | Please do not send more than 100 kilobytes |
|------------------+--------------------------------------------|
| Fingerprint: 8D EF 9F 22 DF 9A 9B 68  E5 8C 12 C7 8D 6A 97 4E |
|---------------------------------------------------------------|
| Legal Warning: Do NOT send unsolicited commercial email to me |

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 5.0i for non-commercial use
Charset: noconv

iQA/AwUBQA135R0PScBNmw8NEQLNzgCgsimp2AZxvlenB0Wc0OeMf5P/OEwAn1xc
fBfc6W6eaWeOKMdLLTGlxf/T
=0pdu
-----END PGP SIGNATURE-----
