From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] SNMP MIB for LVM
References: <25369470B6F0D41194820002B328BDD23004@ATLOPS> <20011003222642.A30A4328FBD@lyta.coker.com.au> <3BBB9521.5753A26B@ivivity.com>
In-Reply-To: <3BBB9521.5753A26B@ivivity.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_VXJRZO5SIW3Z77FZNUGD"
Message-Id: <20011025151930.2F45838344B@lyta.coker.com.au>
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
Date: Thu Oct 25 10:19:01 2001
List-Id: <linux-lvm.redhat.com>
To: Arvind Jain <arvind_jain@ivivity.com>
Cc: linux-lvm@sistina.com

--------------Boundary-00=_VXJRZO5SIW3Z77FZNUGD
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

On Thu, 4 Oct 2001 00:45, you wrote:
> > > Has anybody written or come across MIB for LVM configuration and
> > > maintenance? It will be nice if could configure LVM using SNMP MIB.
> > > thx, arv.
> >
> > First issue, do you have an OSI number assigned for this?
> >
> > If not then I can arrange sub-delegation of part of the Debian number
> > hierarchy to the LVM project.  In Debian discussions it's been generally
> > agreed to give away what are effectively "ISO sub-domains" to open source
> > projects that request them.
>
> I do not have an OSI number assigned for this. thx, arv.

I have assigned you a number under the Debian hierarchy.  The people who 
manage the LVM project can freely use and delegate this number space for 
projects consistant with Debian aims (development of free software).

The current Debian schema file is attached.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

--------------Boundary-00=_VXJRZO5SIW3Z77FZNUGD
Content-Type: text/plain;
  charset="iso-8859-1";
  name="debian.schema"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="debian.schema"

IyB1bmRlciBpc28ub3JnLmRvZC5pbnRlcm5ldC5wcml2YXRlLmVudGVycHJpc2UgKDEuMy42LjEu
NC4xKSB3ZSBoYXZlIERlYmlhbgojICg5NTg2KSBnaXZpbmcgdXMgdGhlIHByZWZpeCBvZiAxLjMu
Ni4xLjQuMS45NTg2LgojCiMgdW5kZXIgdGhlIGJhc2UgT0lEIEkgaGF2ZSBkZWNpZGVkIHRvIHVz
ZSAyIGZvciBMREFQIChsZWF2aW5nIDEgZm9yIFNOTVApLAojIHRoZW4gdW5kZXIgdGhhdCAxIGlz
IGZvciBhdHRyaWJ1dGVzIGFuZCAyIGlzIGZvciBvYmplY3RDbGFzcydzLiAgVGhpcyBpcwojIGFy
Yml0YXJ5IGJ1dCBjb3BpZXMgc29tZSBzYW1wbGUgc2NoZW1hIGZyb20gdGhlIE9wZW5MREFQIGRv
Y3VtZW50YXRpb24KIwojIHVuZGVyIHRoZSBEZWJpYW4gT0lEIGxldCdzIGRlbGVnYXRlIC4xMDAw
IG9ud2FyZHMgdG8gb3RoZXIgb3BlbiBzb3VyY2UKIyBwcm9qZWN0cwojIEN1cnJlbnRseSAxLjMu
Ni4xLjQuMS45NTg2LjEwMDAgaXMgZm9yIExWTS4KCiMgVW5kZXIgdGhlIERlYmlhbiBMREFQIG51
bWJlciBsZXQncyBhc3NpZ24gbnVtYmVyIDEwMCBvbndhcmRzIHRvIERlYmlhbiByZWxhdGVkCiMg
cHJvamVjdHMuCiMgMTAwIGlzIGZvciBzY2FsZW1haWwgd2hpY2ggbWFrZXMgc2NhbGVtYWlsIExE
QVAgYmUgMS4zLjYuMS40LjEuOTU4Ni4yLjEwMAojIDEwMSBpcyBmb3Igc291cmNlZm9yZ2Ugd2hp
Y2ggbWFrZXMgc291cmNlZm9yZ2UgTERBUCBiZSAxLjMuNi4xLjQuMS45NTg2LjIuMTAxCgphdHRy
aWJ1dGV0eXBlICggMS4zLjYuMS40LjEuOTU4Ni4yLjEuMSBOQU1FICdkZWJJcEFsbG93ZWRDbGll
bnRzJwogICAgICAgIERFU0MgJ0lQIGFkZHJlc3Mgb3IgSVAgYWRkcmVzcyByYW5nZSwgZWl0aGVy
IENJRFIgb3IgMS4yLjMuNC0xLjIuMy4xMDAgcmFuZ2UgYWxsb3dlZCB0byBjb25uZWN0JwogICAg
ICAgIEVRVUFMSVRZIGNhc2VJZ25vcmVJQTVNYXRjaAogICAgICAgIFNZTlRBWCAxLjMuNi4xLjQu
MS4xNDY2LjExNS4xMjEuMS4yNnszMn0gKQphdHRyaWJ1dGV0eXBlICggMS4zLjYuMS40LjEuOTU4
Ni4yLjEuMiBOQU1FICdkZWJJcERlbmllZENsaWVudHMnCiAgICAgICAgREVTQyAnSVAgYWRkcmVz
cyBvciBJUCBhZGRyZXNzIHJhbmdlLCBlaXRoZXIgQ0lEUiBvciAxLjIuMy40LTEuMi4zLjEwMCBy
YW5nZSBub3QgYWxsb3dlZCB0byBjb25uZWN0JwogICAgICAgIEVRVUFMSVRZIGNhc2VJZ25vcmVJ
QTVNYXRjaAogICAgICAgIFNZTlRBWCAxLjMuNi4xLjQuMS4xNDY2LjExNS4xMjEuMS4yNnszMn0g
KQphdHRyaWJ1dGV0eXBlICggMS4zLjYuMS40LjEuOTU4Ni4yLjEuMwogICAgICAgIE5BTUUgKCAn
ZGViQWxsb3dlZFNlcnZpY2UnICkKICAgICAgICBERVNDICdTZXJ2aWNlIHRoYXQgdGhpcyBvYmpl
Y3QgYWxsb3dzIGFjY2VzcyB0bywgc3VnZ2VzdGVkIHZhbHVlcyBpbmNsdWRlICJGVFAiLCAiU1NI
IiwgIkhUVFAiLCBvciBvdGhlciBuYW1lcyBmcm9tIC9ldGMvc2VydmljZXMsIG9yICJBTEwiLCBv
ciBpdCBjYW4gYmUgY2xhc3NlcyBvZiBzZXJ2aWNlIEVHICJTVEFGRiIgdG8gbWVhbiB0aGF0IHRo
ZSBhY2NvdW50IHdvcmtzIG9uIHN0YWZmIG1hY2hpbmVzJwogICAgICAgIEVRVUFMSVRZIGNhc2VJ
Z25vcmVNYXRjaAogICAgICAgIFNVQlNUUiBjYXNlSWdub3JlU3Vic3RyaW5nc01hdGNoCiAgICAg
ICAgU1lOVEFYIDEuMy42LjEuNC4xLjE0NjYuMTE1LjEyMS4xLjE1ezI1Nn0gKQphdHRyaWJ1dGV0
eXBlICggMS4zLjYuMS40LjEuOTU4Ni4yLjEuNAogICAgICAgIE5BTUUgKCAnZGViRGVuaWVkU2Vy
dmljZScgKQogICAgICAgIERFU0MgJ1NlcnZpY2UgdGhhdCB0aGlzIG9iamVjdCBkZW5pZXMgYWNj
ZXNzIHRvLCBzdWdnZXN0ZWQgdmFsdWVzIGluY2x1ZGUgIkZUUCIsICJTU0giLCAiSFRUUCIsIG9y
IG90aGVyIG5hbWVzIGZyb20gL2V0Yy9zZXJ2aWNlcywgb3IgIkFMTCIsIG9yIGl0IGNhbiBiZSBj
bGFzc2VzIG9mIHNlcnZpY2UgRUcgIlNUQUZGIiB0byBtZWFuIHRoYXQgdGhlIGFjY291bnQgaXMg
ZGVuaWVkIG9uIHN0YWZmIG1hY2hpbmVzJwogICAgICAgIEVRVUFMSVRZIGNhc2VJZ25vcmVNYXRj
aAogICAgICAgIFNVQlNUUiBjYXNlSWdub3JlU3Vic3RyaW5nc01hdGNoCiAgICAgICAgU1lOVEFY
IDEuMy42LjEuNC4xLjE0NjYuMTE1LjEyMS4xLjE1ezI1Nn0gKQoKCm9iamVjdGNsYXNzICggMS4z
LjYuMS40LjEuOTU4Ni4yLjIuMQogICAgICAgIE5BTUUgJ2RlYk5ldHdvcmtTZWN1cml0eScKICAg
ICAgICBERVNDICdBIHNlY3VyaXR5IG9iamVjdCB0byBzcGVjaWZ5IHRoZSBhY2Nlc3MgdGhhdCBh
IHVzZXIgaGFzIHRvIG5ldHdvcmsgc2VydmljZXMsIG9yIHRoZSBhY2Nlc3MgdGhhdCBhIHNlcnZl
ciBwcm9ncmFtIHByb3ZpZGVzIHRvIHRoZSB3b3JsZC4nCiAgICAgICAgU1VQIHRvcAogICAgICAg
IE1BWSAoIGRlYklwQWxsb3dlZENsaWVudHMgJCBkZWJJcERlbmllZENsaWVudHMgJCBkZWJBbGxv
d2VkU2VydmljZSAkIGRlYkRlbmllZFNlcnZpY2UgKSApCgo=

--------------Boundary-00=_VXJRZO5SIW3Z77FZNUGD--
