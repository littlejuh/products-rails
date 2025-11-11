# Notes API Documentation

This API allows you to manage notes in the system. The endpoints return JSON data and can also be used with Turbo/Hotwire for HTML interactions.

---
### Dependencies
You just need [Docker](https://www.docker.com/ "docker") running in your machine

## How to run local
First build the aplication:
`make build`

Then, run the aplication:
`make run`

## List Notes

**Endpoint:** `GET /notes.json`

**Description:** Returns a list of all notes.

### Request

```http
GET /notes.json
```

### Response

**Status:** 200 OK
**Content-Type:** application/json

**Body Example:**

```json
[
  {
    "id": 5,
    "title": "Reminder",
    "description": "Don’t forget to write the thesis conclusion by next week.",
    "created_at": "2025-08-27T17:47:26.811Z",
    "updated_at": "2025-08-27T17:47:26.811Z"
  },
  {
    "id": 4,
    "title": "Ideas",
    "description": "Build a personal blog with Rails 7 + Hotwire.",
    "created_at": "2025-08-27T17:47:26.799Z",
    "updated_at": "2025-08-27T17:47:26.799Z"
  }
]
```

### Fields

| Field         | Type    | Description                              |
| ------------- | ------- | ---------------------------------------- |
| `id`          | integer | Unique identifier of the note            |
| `title`       | string  | Title of the note                        |
| `description` | string  | Content or description of the note       |
| `created_at`  | string  | Timestamp when the note was created      |
| `updated_at`  | string  | Timestamp when the note was last updated |

### Example local cURL

```bash
curl -X GET "http://127.0.0.1:3000/notes.json" \
     -H "Accept: application/json"
```

---
## [WIP]Show Note

**Endpoint:** `GET /notes/:id.json`
**Description:** Returns a single note by ID.

### Request

```http
GET /notes/5.json
Accept: application/json
```

### Response

**Status:** 200 OK
**Body Example:**

```json
{
  "id": 5,
  "title": "Reminder",
  "description": "Don’t forget to write the thesis conclusion by next week.",
  "created_at": "2025-08-27T17:47:26.811Z",
  "updated_at": "2025-08-27T17:47:26.811Z"
}
```

---

## [WIP]Create Note

**Endpoint:** `POST /notes.json`
**Description:** Creates a new note.

### Request

```http
POST /notes.json
Content-Type: application/json

{
  "note": {
    "title": "New Note",
    "description": "This is a new note."
  }
}
```

### Response

**Status:** 201 Created
**Body Example:**

```json
{
  "id": 6,
  "title": "New Note",
  "description": "This is a new note.",
  "created_at": "2025-08-27T18:00:00.000Z",
  "updated_at": "2025-08-27T18:00:00.000Z"
}
```

---

## [WIP]Update Note

**Endpoint:** `PATCH /notes/:id.json`
**Description:** Updates an existing note.

### Request

```http
PATCH /notes/5.json
Content-Type: application/json

{
  "note": {
    "title": "Updated Reminder",
    "description": "Updated note description."
  }
}
```

### Response

**Status:** 200 OK
**Body Example:**

```json
{
  "id": 5,
  "title": "Updated Reminder",
  "description": "Updated note description.",
  "created_at": "2025-08-27T17:47:26.811Z",
  "updated_at": "2025-08-27T18:05:00.000Z"
}
```

---

## [WIP]Delete Note

**Endpoint:** `DELETE /notes/:id.json`
**Description:** Deletes a note by ID.

### Request

```http
DELETE /notes/5.json
```

### Response

**Status:** 204 No Content
